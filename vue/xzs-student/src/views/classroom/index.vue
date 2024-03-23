<template>
  <div style="margin-top: 10px">
    <h3 class="index-title-h3" style="border-left: solid 10px #3651d4;">我的预约</h3>
    <el-row>
      <el-col :span="8" v-for="classroom in classroomList" :key="classroom.id">
        <el-card :body-style="{ padding: '200px' }">
          <img src="https://imgservice.suning.cn/uimg1/b2c/image/leG806yl1eKZQ-uwSrizYQ.jpg_800w_800h_4e" class="image" style="max-width: 100%; height: auto;">
          <div style="padding: 20px 20px 10px 20px;"> <!-- 调整这里的padding值 -->
            <span>教室：{{ classroom.name }}</span>
            <tr></tr>
            <span>人数：{{ classroom.hasNum }}/{{ classroom.totalNum }}</span>
            <el-button  type="primary" style="margin-left: 16px;" @click="handleDraw(classroom.name)">预约这个教室</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-drawer
      title="预约这间教室"
      :visible.sync="drawer"
      direction="btt"
      :before-close="handleClose">
      <div style="display: flex;"><p>请选择时间段</p>
        <el-date-picker
        v-model="date"
        type="datetimerange"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期">
        </el-date-picker><el-button type="primary"  style="height: 30px;" @click="submit">确认</el-button></div>
    </el-drawer>
  </div>
</template>

<script>
import ClassroomApi from '@/api/classroom'
export default {
  data () {
    return {
      date: [new Date(2000, 10, 10, 10, 10), new Date(2000, 10, 11, 10, 10)],
      classroomList: [], // 新增教室列表数据
      drawer: false,
      direction: 'btt'
    }
  },
  created () {
    this.search()
  },
  methods: {
    search () {
      this.listLoading = true
      let _this = this
      ClassroomApi.list(this.queryParam).then(data => {
        const re = data.response
        _this.classroomList = re // 更新教室列表数据
        _this.total = re.total
        _this.queryParam.pageIndex = re.pageNum
        _this.listLoading = false
      })
    },
    handleClose (done) {
      this.$confirm('确认关闭？')
        .then(_ => {
          done()
        })
        .catch(_ => {})
    },
    handleDraw (name) {
      this.drawer = true
      this.selectedClassName = name
    },
    submit () {
      const startDate = this.date[0]
      const endDate = this.date[1]
      console.log('Start Date:', startDate)
      console.log('End Date:', endDate)
      console.log(this.selectedClassName)
      const submitData = {
        className: this.selectedClassName,
        startDate: startDate,
        endDate: endDate
      };
      ClassroomApi.submit(submitData).then(response => {
        alert('预约成功')
        this.search();
      })
    }
  },
  computed: {
  }
}
</script>

<style lang="scss" scoped>
.time {
  font-size: 13px;
  color: #999;
}

.bottom {
  margin-top: 13px;
  line-height: 12px;
}

.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px;
  text-align: center;
  text-decoration: none;
  display: flex; /* 设置为弹性布局 */
  align-items: center; /* 垂直居中 */
  justify-content: space-between; /* 水平两端对齐 */
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 8px;
}

.button span {
  flex: 1; /* 设置为自动填充剩余空间 */
}

.image {
  width: 100%;
  display: block;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}
</style>
