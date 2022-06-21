class ApiConst {
  static const server = 'http://10.0.2.2:8000/';
  // static const server = 'https://tapro.pusproject.com/'; //To Online
  //Auth
  static const authLogin = '${server}api/auth/login';
  static const authRegister = '${server}api/auth/register';
  //Workspace
  static const getWorkspace = '${server}api/workspace/data';
  //Project
  static const getProject = '${server}api/project/data';
  //Task
  static const getTask = '${server}api/task/data';
  //Member
  static const getMember = '${server}api/member/data';
}