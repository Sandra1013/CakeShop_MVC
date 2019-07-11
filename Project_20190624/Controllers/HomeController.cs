using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_20190624.Models;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System.IO;


namespace Project_20190624.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        dbCakeShopEntities db = new dbCakeShopEntities();
        private IWebDriver driver;
        public string fileName;
        public int total = 0;
     
        // GET: Home
        public ActionResult Index()
        {
            if (Session["Member"]==null)
            {
                Session["Total"] = 0;
            }
            else
            {
                string userName = (Session["Member"] as tMember).userName;
                var buyAmount = db.tOrderDetails.Where(m => m.isApprove == "否" && m.userName == userName).ToList();
                foreach (var item in buyAmount)
                {
                    total += (int)item.pQty;
                }
                Session["Total"] = total;
            }
                var commentList = db.tComments.OrderByDescending(m => m.CommentDate).ToList();

                return View("Index", "_LayoutHome", commentList);
        }

        public ActionResult Product()
        {
            var product = db.tProds.ToList();

            return View("Product", "_LayoutContent", product);
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(tMember member)
        {
            var checkmember = db.tMembers.Where(m => m.email == member.email).FirstOrDefault();

            if (member.pwd != member.repwd)
            {
                ViewBag.Message = "設定密碼與確認密碼不同，請確認!";
                return View();
            }

            if (checkmember == null)
            {
                db.tMembers.Add(member);
                db.SaveChanges();
                return RedirectToAction("Login");
            }
            else
            {
                ViewBag.Message = "此帳號已註冊過，請確認!";
                return View();
            }
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string email, string pwd)
        {
            var member = db.tMembers.Where(m => m.email == email && m.pwd == pwd).FirstOrDefault();
            if (member == null)
            {
                ViewBag.Message = "請確認帳號密碼是否正確!";
                return View();
            }
            if (email == "admin@gmail.com")
            {
                Session["Admin"] = "admin";
            }
            if (email == "staff@gmail.com")
            {
                Session["Staff"] = "staff";
            }
            Session["Welcome"] = "Hello!" + member.userName;
            Session["Member"] = member;
            return RedirectToAction("Index");
        }

            public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }

        public ActionResult AddCart(string pName)
        {
            string userName = (Session["Member"] as tMember).userName;
            var currentCar = db.tOrderDetails.Where(m => m.pName == pName && m.isApprove == "否" && m.userName == userName).FirstOrDefault();
            if (currentCar == null)
            {
                var product = db.tProds.Where(m => m.pName == pName).FirstOrDefault();
                tOrderDetail newOrder = new tOrderDetail();
                newOrder.userName = userName;
                newOrder.pName = product.pName;
                newOrder.pPrice = product.pPrice;
                newOrder.pQty = 1;
                newOrder.isApprove = "否";
                db.tOrderDetails.Add(newOrder);
            }
            else
            {
                currentCar.pQty += 1;
            }
            db.SaveChanges();

            var buyAmount = db.tOrderDetails.Where(m => m.isApprove == "否" && m.userName == userName).ToList();
            foreach (var item in buyAmount)
            {
                total += (int)item.pQty;
            }
            Session["Total"] = total;
            return RedirectToAction("Product");
        }

        public ActionResult DeleteCart(int Id)
        {
            var delOrder = db.tOrderDetails.Where(m => m.Id == Id).FirstOrDefault();
            db.tOrderDetails.Remove(delOrder);
            db.SaveChanges();
            string userName = (Session["Member"] as tMember).userName;
            var buyAmount = db.tOrderDetails.Where(m => m.isApprove == "否" && m.userName==userName).ToList();
            foreach (var item in buyAmount)
            {
                total += (int)item.pQty;
            }
            Session["Total"] = total;
            return RedirectToAction("ShopCart");
        }

        public ActionResult ShopCart(tMember member)
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            string userName = (Session["Member"] as tMember).userName;
            var orderDetails = db.tOrderDetails.Where(m => m.userName == userName && m.isApprove == "否").ToList();

            var buyAmount = db.tOrderDetails.Where(m => m.isApprove == "否"&&m.userName==userName).ToList();
            foreach (var item in buyAmount)
            {
                total += (int)item.pQty;
            }
            Session["Total"] = total;
            return View("ShopCart", "_LayoutContent", orderDetails);
        }

        [HttpPost]
        public ActionResult ShopCart(string recName, string address)
        {
            string userName = (Session["Member"] as tMember).userName;
            string guid = Guid.NewGuid().ToString().Substring(0, 8);
            //tOrderDetail newOrder = new tOrderDetail();
            var orderList = db.tOrderDetails.Where(m => m.isApprove == "否" && m.userName == userName).ToList();
            foreach (var item in orderList)
            {
                item.OrderGuid = guid;
                item.isApprove = "是";
                item.recName = recName;
                item.address = address;
                item.OrderDate = DateTime.Now;
            }
            db.SaveChanges();
            Session["Total"] = 0;
            return RedirectToAction("OrderDetail");
        }

        public ActionResult OrderDetail()
        {
            if (Session["Member"] == null)
            {
                return RedirectToAction("Login");
            }
            string userName = (Session["Member"] as tMember).userName;
            var orderDetail = db.tOrderDetails.Where(m => m.userName == userName).OrderByDescending(m => m.OrderDate).ToList();
            return View("OrderDetail", "_LayoutContent", orderDetail);
        }

        public ActionResult DeleteOrder(int Id)
        {
            var delItem = db.tOrderDetails.Where(m => m.Id == Id).FirstOrDefault();
            db.tOrderDetails.Remove(delItem);
            db.SaveChanges();
            return RedirectToAction("OrderDetail");
        }

        public ActionResult DispatchList()
        {
            if (Session["Staff"] == null)
            {
                return RedirectToAction("Login");
            }
            var dispatchList = db.tOrderDetails.Where(m => m.isApprove == "是").ToList();
            return View("DispatchList", "_LayoutContent", dispatchList);
        }
        public ActionResult Dispatch(int Id)
        {
            var dispatchList = db.tOrderDetails.Where(m => m.isApprove == "是" && m.Id == Id).FirstOrDefault();
            dispatchList.isApprove = "已出貨";
            db.SaveChanges();
            return RedirectToAction("DispatchList");
        }

        public ActionResult MemberList()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("Login");
            }
            var memberList = db.tMembers.OrderBy(m => m.birthDay.ToString().Substring(5, 2)).ThenByDescending(m => m.userName).ToList();
            return View("MemberList", "_LayoutContent", memberList);
        }

        public ActionResult Blog(tIG IG)
        {
            ChromeOptions chromeBrowserOptions = new ChromeOptions();
            //需要阻擋跳出視窗時，可將下面註解移除
            chromeBrowserOptions.AddArgument("--headless");
            driver = new ChromeDriver(chromeBrowserOptions);
            //開啟網頁
            driver.Navigate().GoToUrl("https://www.instagram.com/explore/tags/patisserieyehz/");
            //隱式等待 - 直到畫面跑出資料才往下執行
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(2);

            var PostContainerElement = driver.FindElement(By.ClassName("EZdmt"));
            //每一行
            var Rows = PostContainerElement.FindElements(By.ClassName("Nnq7C"));
            foreach (var row in Rows)
            {
                var Boxs = row.FindElements(By.XPath("div"));
                foreach (var box in Boxs)
                {
                    //點擊每一格讓它展開Dialog
                    box.Click();
                    //這就是一個 XPath 規則，它就代表選擇所有名稱為 div，同時屬性 role 的值為 dialog 的節點
                    //取得Dialog底下的Article元素
                    var article = driver.FindElement(By.XPath("//div[@role='dialog']/div/div/article"));
                    string content = article.FindElement(By.ClassName("C4VMK")).FindElement(By.TagName("span")).Text;
                    //如果Dialog裡面放的是影片，則_97aPb 會不存在
                    if (article.FindElements(By.ClassName("_97aPb ")).Count == 0)
                    {
                        //關閉Dialog
                        driver.FindElement(By.ClassName("ckWGn")).Click();
                        //跳過這則，這次目標只抓出圖片
                        continue;
                    }

                    //第一張圖
                    var ImgContainer = article.FindElement(By.ClassName("_97aPb "));
                    string igImage = article.FindElement(By.ClassName("KL4Bh")).FindElement(By.TagName("img")).GetAttribute("src");
                    var Img = ImgContainer.FindElement(By.TagName("img"));
                    var Date = article.FindElement(By.XPath("div/div/a/time"));
                    string postDate = Convert.ToDateTime(Date.Text).ToShortDateString();
                    string igLink = article.FindElement(By.XPath("div/div/a")).GetAttribute("href");
                    IG.IgContent = content;
                    IG.IgSrc = igImage;
                    IG.IgDate = postDate;
                    IG.IgLink = igLink;
                    var check = db.tIGs.Where(m => m.IgLink == igLink).FirstOrDefault();
                    if (check != null)
                    {
                        driver.FindElement(By.ClassName("ckWGn")).Click();
                        continue;
                    }
                    db.tIGs.Add(IG);
                    db.SaveChanges();
                    //關閉Dialog
                    driver.FindElement(By.ClassName("ckWGn")).Click();
                }
            }
            driver.Quit();
            var blog = db.tIGs.OrderByDescending(m => m.IgDate).ToList();
            return View("Blog", "_LayoutContent", blog);
        }

        public ActionResult Contact()
        {
            //tComment lastestComment = new tComment();
            var Comment = db.tComments.OrderByDescending(m => m.CommentDate).FirstOrDefault();
            return View("Contact", "_LayoutContent", Comment);
        }

        [HttpPost]
        public ActionResult Contact(tComment comment, HttpPostedFileBase file)
        {
            if (file != null)
            {
                if (file.ContentLength > 0)
                {
                    fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    file.SaveAs(path);
                }
            }
            else
            {
                fileName = "cc4.png";
            }

            comment.CommentDate = DateTime.Now;
            comment.Image = fileName;
            db.tComments.Add(comment);
            db.SaveChanges();
            var latestComment = db.tComments.OrderByDescending(m => m.CommentDate).FirstOrDefault();
            return View(latestComment);
        }

        public ActionResult CommentList()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("Login");
            }
            var CommentList = db.tComments.OrderByDescending(m => m.CommentDate).ToList();
            return View("CommentList", "_LayoutContent", CommentList);
        }
        public ActionResult delComment(int Id)
        {

            var comment = db.tComments.Where(m => m.Id == Id).FirstOrDefault();
            db.tComments.Remove(comment);
            db.SaveChanges();
            return RedirectToAction("CommentList");
        }

        //public ActionResult Upload()
        //{
            //return View("");
        //}

        //[HttpPost]
        //public ActionResult Upload(HttpPostedFileBase file)
        //{
            //if (file != null)
            //{
                //if (file.ContentLength > 0)
                //{
                    //fileName = Path.GetFileName(file.FileName);
                    //var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    //file.SaveAs(path);
                //}
            //}
            //return RedirectToAction("Contact");
        //}

    }
}