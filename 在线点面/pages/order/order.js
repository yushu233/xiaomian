// pages/order/order.js
var app = getApp()

// 时间格式化函数
const formatTime = (isoString) => {
  if (!isoString) return '';
  // 去掉末尾的 'Z' 和毫秒部分，并替换 'T' 为空格
  return isoString.replace('T', ' ').replace(/\.\d+Z$/, '');
};

Page({
  /**
   * 页面的初始数据
   */
  data: {
    foodlist: [],
    overlist: []
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function () {
    wx.request({
      url: app.globalData.serveraddr + '/order/getOrders',
      data: {
        cusid: app.globalData.cusid
      },
      success: res => {
        // 格式化已完成订单的时间
        const formattedOverlist = res.data.overOrder.reverse().map(item => {
          return {
            ...item,
            CREATETIME: formatTime(item.CREATETIME)
          };
        });
        this.setData({
          overlist: formattedOverlist
        });
        var foodlist = []
        var orderlist = []
        for (let i = 0; i < res.data.order.length; i++) {
          var order = {
            orderid: '',
            orderPrice: 0,
            foods: [],
            createTime: '' // 新增创建时间字段
          }
          order.orderid = res.data.order[i].ORDERID
          order.orderPrice = res.data.order[i].ORDERTOTLEPRICE
          order.orderTime = res.data.order[i].ORDERTIME
          order.orderNum = res.data.order[i].ORDERNUM
          order.orderState = res.data.order[i].ORDERSTATE
          order.orderSort = res.data.order[i].orderSort
          order.createTime = formatTime(res.data.order[i].CREATETIME) // 格式化时间
          for (let k = 0; k < res.data.orderDetailAll.length; k++) {
            for (let j = 0; j < res.data.orderDetailAll[k].length; j++) {
              if (order.orderid == res.data.orderDetailAll[k][j].ORDERID) {
                order.foods.push(res.data.orderDetailAll[k][j].GNAME + '*' + res.data.orderDetailAll[k][j].GCOUNT)
              }
            }
          }
          foodlist.push(order)
        }
        for (let i = 0; i < foodlist.length; i++) {
          if (foodlist[i].orderState == 1) {
            orderlist.push(foodlist[i])
          }
        }
        this.setData({
          foodlist: orderlist.reverse()
        })
      }
    })
  },
  agin: function () {
    wx.redirectTo({
      url: '../menu/menu',
    })
  }
})