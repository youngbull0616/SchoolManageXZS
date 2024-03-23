import { post } from '@/utils/request'

export default {
  getCurrentUser: () => post('/api/admin/user/current'),
  changeStatus: id => post('/api/admin/user/changeStatus/' + id),
  selectByUserName: query => post('/api/admin/user/selectByUserName', query)
}
