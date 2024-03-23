import { post } from '@/utils/request'

export default {
  pageList: query => post('/api/admin/attendance/page', query),
  changeStatus: query => post('api/admin/attendance/changeStatus', query)
}
