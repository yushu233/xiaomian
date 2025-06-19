// client/pages/menu/menu.js
var app = getApp();
var sliderWidth = 96;
var foodList = [];
Page({
  data: {
    tabs: [],
    activeIndex: 0,
    sliderOffset: 0,
    sliderLeft: 0,
    foodNum: 0,
    sumprice: 0,
    psumprice: 0,
    mydata: [],
    myfoodList: [],
    serveraddr: app.globalData.serveraddr,
   },
  onLoad: function() {
    var that = this;
    wx.request({
      url: app.globalData.serveraddr + '/menu',
      success: res => {
        var gtList = []
        for (var i = 0; i < res.data.gtlist.length; i++) {
          gtList.push(res.data.gtlist[i].gt);
        }
        this.setData({
          tabs: gtList,
          mydata: res.data.gtlist
        })
        wx.getSystemInfo({
          success: function (res) {
            that.setData({
              sliderLeft: (res.windowWidth / that.data.tabs.length - sliderWidth) / 2,
              sliderOffset: res.windowWidth / that.data.tabs.length * that.data.activeIndex
            });
          }
        });
      }
    })
  },
    // 下拉刷新处理
  onPullDownRefresh: function() {   
      // 显示刷新完成提示
      wx.showToast({
        title: '刷新成功',
        icon: 'success',
        duration: 1500
      });
    },
    // 上拉触
  onReachBottom: function() {
         wx.showToast({
        title: '再吃就空了',
        icon: 'success',
        duration: 1500
      });
    }, 
  tabClick: function(e) {
    this.setData({
      sliderOffset: e.currentTarget.offsetLeft,
      activeIndex: e.currentTarget.id
    });
  },
  add: function(e) {
    var list = this.data.mydata;
    for (var i = 0; i < list.length; i++) {
      if (list[i].gt.gtid == e.currentTarget.dataset.gtid) {
        var glist = list[i].goodslist
        for (var j = 0; j < glist.length; j++) {
          if (glist[j].gid == e.currentTarget.dataset.gid) {
            glist[j].gcount += 1;
            var sumnum = this.data.foodNum + 1;
            var sum = this.data.sumprice + e.currentTarget.dataset.gprice;
            var psum = this.data.psumprice + e.currentTarget.dataset.gtime;
            this.setData({
              mydata: list,
              foodNum: sumnum,
              sumprice: sum,
              psumprice: sum,
            })
          }
        }
      }
    }
  },
  subtract: function(e) {
    var list = this.data.mydata;
    for (var i = 0; i < list.length; i++) {
      if (list[i].gt.gtid == e.currentTarget.dataset.gtid) {
        var glist = list[i].goodslist
        for (var j = 0; j < glist.length; j++) {
          if (glist[j].gid == e.currentTarget.dataset.gid) {
            if (glist[j].gcount > 0) {
              glist[j].gcount -= 1;
              var sumnum = this.data.foodNum - 1;
              var sum = this.data.sumprice - e.currentTarget.dataset.gprice;
              var psum = this.data.psumprice - e.currentTarget.dataset.gtime;
              this.setData({
                mydata: list,
                foodNum: sumnum,
                sumprice: sum,
                psumprice: psum,
              })
            }
          }
        }
      }
    }
  }, 
  goinfo: function(e) {
    var list = this.data.mydata;
    for (var i = 0; i < list.length; i++) {
      if (list[i].gt.gtid == e.currentTarget.dataset.gtid) {
        var glist = list[i].goodslist
        for (var j = 0; j < glist.length; j++) {
          if (glist[j].gid == e.currentTarget.dataset.gid) {
            wx.navigateTo({
              url: '../info/info?foodinfo=' + JSON.stringify(glist[j])
            })
          }
        }
      }
    }
  },
  
  pay: function() {
    var foodlist = new Array();
    for (var i = 0; i < this.data.mydata.length; i++) {
      for (var j = 0; j < this.data.mydata[i].goodslist.length; j++) {
        if (this.data.mydata[i].goodslist[j].gcount > 0) {
          foodlist.push(this.data.mydata[i].goodslist[j])
        }
      }
    }
    this.setData({
      myfoodList: foodlist
    })
    console.log(this.data.myfoodList)
    wx.navigateTo({
      url: '../usermenu/usermenu?foodslist=' + JSON.stringify(this.data.myfoodList)
    })
  },
})