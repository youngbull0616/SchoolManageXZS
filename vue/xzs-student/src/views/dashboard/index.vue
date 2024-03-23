<template>
  <div style="margin-top: 10px">
    <el-row>
      <el-carousel :interval="5000" arrow="always" type="card">
        <el-carousel-item >
          <img src="@/assets/carousel/1.png" class="carousel-img">
        </el-carousel-item>
        <el-carousel-item >
          <img src="@/assets/carousel/2.png" class="carousel-img">
        </el-carousel-item>
        <el-carousel-item >
          <img src="@/assets/carousel/3.png" class="carousel-img">
        </el-carousel-item>
        <el-carousel-item >
          <img src="@/assets/carousel/4.png" class="carousel-img">
        </el-carousel-item>
      </el-carousel>
    </el-row>
  </div>
</template>

<script>
import { mapState, mapGetters } from 'vuex'
import indexApi from '@/api/dashboard'
export default {
  data () {
    return {
      fixedPaper: [],
      timeLimitPaper: [],
      pushPaper: [],
      loading: false,
      taskLoading: false,
      taskList: []
    }
  },
  created () {
    let _this = this
    this.loading = true
    indexApi.index().then(re => {
      _this.fixedPaper = re.response.fixedPaper
      _this.timeLimitPaper = re.response.timeLimitPaper
      _this.pushPaper = re.response.pushPaper
      _this.loading = false
    })

    this.taskLoading = true
    indexApi.task().then(re => {
      _this.taskList = re.response
      _this.taskLoading = false
    })
  },
  methods: {
    statusTagFormatter (status) {
      return this.enumFormat(this.statusTag, status)
    },
    statusTextFormatter (status) {
      return this.enumFormat(this.statusEnum, status)
    }
  },
  computed: {
    ...mapGetters('enumItem', [
      'enumFormat'
    ]),
    ...mapState('enumItem', {
      statusEnum: state => state.exam.examPaperAnswer.statusEnum,
      statusTag: state => state.exam.examPaperAnswer.statusTag
    })
  }
}
</script>

<style lang="scss" scoped>
  .index-title-h3 {
    font-size: 22px;
    font-weight: 400;
    color: #1f2f3d;
    border-left: solid 10px #2ce8b4;
    padding-left: 10px;
  }

  .el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 300px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }

  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 50%;
    height: 80%;
    display: block;
    margin: 20px auto 10px auto;
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
