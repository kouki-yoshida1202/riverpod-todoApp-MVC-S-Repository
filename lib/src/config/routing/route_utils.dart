// todoアプリの画面遷移を管理するenum
enum AppPage {
  login,
  register,
  teamTodoList,
  myTodoList,
  addTodo,
  editTodo,
  profile,
  editProfile,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.login:
        return '/login';
      case AppPage.register:
        return '/register';
      case AppPage.teamTodoList:
        return '/Team-todo-list';
      case AppPage.myTodoList:
        return '/my-todo-list';
      case AppPage.addTodo:
        return '/add-todo';
      case AppPage.editTodo:
        return '/edit-todo';
      case AppPage.profile:
        return '/profile';
      case AppPage.editProfile:
        return '/edit-profile';
    }
  }

  String get paramName {
    switch (this) {
      case AppPage.editTodo:
        return 'todoId';
      default:
        return '';
    }
  }
}
