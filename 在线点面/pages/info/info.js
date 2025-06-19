// client/pages/info/info.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    foodinfo: {
      "gid": "134e4353-6a1e-44f8-ab70-9059134dedeb",
      "gtid": "1",
      "gname": "豌杂面",
      "gprice": 15,
      "gstate": 1,
      "gimg": "1.jpg",
      "gtime": 15,
      "gcontent": "周一至周六  8：00-22：00\n\n",
      "gcount": 0,
      "gremark": 233,
      "ginfo": {
        component: "优质面条",
        supplier: "手杆面筋",
        describe: "这是一份我们亲手杆的面，加上些许豌豆花生肉酱，味道喷香迷人！"
      }
    },
    swiperCurrent: 0,
    indicatorDots: true,
    autoplay: true,
    interval: 3000,
    duration: 800,
    circular: true,
    contactList: [
      {
        // 菜品id
        "gid": "72374eee-c5a5-4b54-b007-7ce5e7ffbb0e",
        // 菜品种类
        "gtid": "1",
        // 菜品名
        "gname": "泡椒鸡杂面/米线",
        // 价格
        "gprice": 12,
        // "gstate": 1,
        // 图片
        "gimg": "4.jpg",
        // 原价
        "gtime": 12,
        // 描述
        "gcontent": "周一至周六  8：00-22：00\n\n",
        // 菜品数量
        "gcount": 0,
        // 评论数
        "gremark": 233,
        // 详细信息
        "ginfo": {
          // 原材料
          component: "优质米面",
          // 供应商
          supplier: "手擀面",
          // 详细描述
          describe: "只有对爱吃泡椒鸡杂的渴望。"
        },
      }, 
      {
        "gid": "89e8ec77-8820-48c1-9d4e-f001f093ff93",
        "gtid": "1",
        "gname": "豌杂面",
        "gprice": 15,
        "gstate": 1,
        "gimg": "1.jpg",
        "gtime": 15,
        "gcontent": "周一至周六  8：00-22：00\n\n",
        "gcount": 0,
        "gremark": 233,
        "ginfo": {
          component: "优质面条",
          supplier: "手杆面筋",
          describe: "这是一份我们亲手杆的面，加上些许豌豆花生肉酱，味道喷香迷人！"
        }
      },
      {
        "gid": "2055204c-ed46-4ba1-890a-fd69f10353d8",
        "gtid": "1",
        "gname": "酸菜牛肉面/米线",
        "gprice": 16,
        "gstate": 1,
        "gimg": "2.jpg",
        "gtime": 16,
        "gcontent": "周一至周六  8：00-22：00\n\n",
        "gcount": 0,
        "gremark": 233,
        "ginfo": {
          component: "优质面粉",
          supplier: "手杆米面",
          describe: "我们酸菜酸甜脆爽，吃完解辣，值得一试！"
        }
      },
      {
        "gid": "4b9363b7-a4f8-4329-8024-b53386cf4ddc",
        "gtid": "1",
        "gname": "麻辣小面",
        "gprice": 8,
        "gstate": 1,
        "gimg": "5.jpg",
        "gtime": 8,
        "gcontent": "周一至周六  8：00-22：00\n\n",
        "gcount": 0,
        "gremark": 233,
        "ginfo": {
          component: "优质面粉",
          supplier: "手杆米面",
          describe: "优惠实在，好吃管饱！"
        }
      },
      {
        "gid": "134e4353-6a1e-44f8-ab70-9059134dedeb",
        "gtid": "1",
        "gname": "辣子鸡拌面",
        "gprice": 12,
        "gstate": 1,
        "gimg": "12.jpg",
        "gtime": 8,
        "gcontent": "周一至周六  8：00-22：00\n\n",
        "gcount": 0,
        "gremark": 233,
        "ginfo": {
          component: "优质面粉",
          supplier: "手杆米面",
          describe: "优惠实在，好吃管饱！"
        }
      }
    ]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (e) {
    this.setData({
      foodinfo: JSON.parse(e.foodinfo)
    })
  },
  //轮播图的切换事件
  swiperChange: function (e) {
    this.setData({
      swiperCurrent: e.detail.current
    })
  },
  goinfo: function (e) {
    var contact = this.data.contactList;
    for (var i = 0; i < contact.length; i++) {
      if (e.currentTarget.dataset.gid == contact[i].gid) {
        var food = contact[i];
        contact.splice(i, 1, this.data.foodinfo);
        this.setData({
          foodinfo: food,
          contactList: contact
        })
      }
      console.log(this.data.contactList);
    }
  },
  //点击指示点切换
  chuangEvent: function (e) {
    this.setData({
      swiperCurrent: e.currentTarget.id
    })
  },
})