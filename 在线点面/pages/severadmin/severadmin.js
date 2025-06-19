// pages/severadmin/severadmin.js
Page({
  /**
   * 页面的初始数据
   */
  data: {
    adminlist: [{
      id: '1',
      avtar: "../img/uservatar.png",
      name: "张三宝"
    } ],
    addflag: false,
  },
  submitadd: function(e) {
    var admin = {
      id: '3',
      avtar: "../img/uservatar.png",
      name: ""
    }
    admin.id = e.detail.value.id;
    admin.name = e.detail.value.id;
    this.data.adminlist.push(admin);
    this.setData({
      adminlist: this.data.adminlist,
      addflag: false,
    })
  },
  subtract: function(e) {
    console.log(e.target.dataset.id)
  },
  add: function() {
    this.setData({
      addflag: true
    })
  },
})