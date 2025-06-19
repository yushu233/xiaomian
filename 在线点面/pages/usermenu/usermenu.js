// client/pages/pay/pay.js
var app = getApp()
Page({
  /**
   * 页面的初始数据
   */
  data: {
    myfoodsList: [],
    sumprice: 0,
    serveraddr: app.globalData.serveraddr
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(e) {
    this.setData({
      myfoodsList: JSON.parse(e.foodslist),
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {
    var sum = 0;
    for (var i = 0; i < this.data.myfoodsList.length; i++) {
      sum = sum + this.data.myfoodsList[i].gcount * this.data.myfoodsList[i].gprice;
    }
    console.log(this.data.myfoodsList.length);
    this.setData({
      sumprice: sum,
    })
  },
   goinfo: function(e) {
    var list = this.data.myfoodsList;
    for (var i = 0; i < list.length; i++) {
      if (list[i].gid == e.currentTarget.dataset.gid) {
        wx.navigateTo({
          url: '../info/info?foodinfo=' + JSON.stringify(list[i])
        })
      }
    }
  },
  gopay: function() {
    wx.redirectTo({
      url: '../pay/pay?sumprice=' + this.data.sumprice + '&foodlist=' + JSON.stringify(this.data.myfoodsList),
    })
  }
})