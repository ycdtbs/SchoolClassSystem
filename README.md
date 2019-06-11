<h1>课表管理系统，主要服务于中小型学校的课表设置，以及小型的教师管理</h1>
<h2>主要功能如下</h2>
<h3>1.登陆系统</h3>
<h4>登陆系统对管理员和教师的身份进行识别，以进入不同的用户界面</h4>
<h3>2.管理员账户</h3>
<h4>管理员界面拥有如下的功能</h4>  
<p>1.对教师的信息进行增删改查</p><br>
<p>2.对年级信息进行增删改查</p><br>
<p>3.对班级和年级信息进行增删改查</p><br>
<p>4.对科目信息进行增删改查</p><br>
<p>5.设置课程表</p>
<h4>登陆系统截图</h4>   
<img src="https://chengpicture.oss-cn-beijing.aliyuncs.com/%E8%AF%BE%E7%A8%8B%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/%E8%AF%BE%E8%A1%A8%E8%AE%BE%E7%BD%AE.gif">
<p>使用说明：登陆界面完成对系统登录的功能同时对登陆用户的权限进行判断，以到达不同的用户界面</p>
<h4>管理员界面以及操作演示</h4>
![11](https://chengpicture.oss-cn-beijing.aliyuncs.com/%E8%AF%BE%E7%A8%8B%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/%E7%AE%A1%E7%90%86%E5%91%98%E6%BC%94%E7%A4%BA.gif)  
<p>使用说明：右边侧栏为功能选择，顶部为用户状态及功能选择</p><br>
<p>1.教师信息管理：教师信息管理分为对教师信息进行增删改查，同时可以添加教师，用户需要手动输入需要添加的信息</p><br>
<p>2.年级信息管理：年级信息管理包含了对班级信息进行管理，对年级信息进行管理，同时进行学年升级的操作，当用户新增学年时默认为添加新一年的一年级，其他操作可以用修改学年来进行修改</p><br>
<p>3.科目信息管理：对学校现存的教学科目进行管理注意的是此功能与教师信息功能在数据库中有关联，在设计数据时需要特别的注意</p><br>
<p>4.课表设置：课表设置中我们通过教师来添加课表，选中我们需要进行操作的教学班级，并点击表格，输入教师姓名即可添加教师以及所对应的科目信息，选择按照教师姓名查看课表，可以查看老师在某节课在哪个班上课的信息</p><br>
<h4>教师界面以及操作演示</h4>
![11](https://chengpicture.oss-cn-beijing.aliyuncs.com/%E8%AF%BE%E7%A8%8B%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/%E6%95%99%E5%B8%88%E6%BC%94%E7%A4%BA.gif)   
<p>教师界面较为简单，教师界面主要是教师查看通知以及教师可以查看自己的课表，同时可以修改自己的个人信息</p>  
<h4>数据库设计</h4>
![11](https://chengpicture.oss-cn-beijing.aliyuncs.com/%E8%AF%BE%E7%A8%8B%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F/%E6%95%B0%E6%8D%AE%E5%BA%93%E8%AE%BE%E8%AE%A1uml%E5%9B%BE.jpg)
<p>数据库设计主要为六个表：</p><br>
<p>登陆数据表：用来存放管理员及教师们的账号密码以及用户权限特征码</p><br>
<p>教师信息数据表：用来存放教师的id，姓名，所授科目</p><br>
<p>年级数据表：用来存放年级名称，学年</p><br>
<p>班级信息数据表：用来存放班级名称，学年</p><br>
<p>课程信息数据表：用来存放课程表，是本系统最重要的表</p><br>
<p>学科信息数据表：用来存放学科信息</p><br>
