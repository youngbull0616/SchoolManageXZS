import { post } from '@/utils/request'

export default {
  list: query => post('/api/student/classroom/list', query),
  submit: query => post('/api/student/classroom/submit', query)
}
