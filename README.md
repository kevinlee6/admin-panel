# [Admin Panel](https://rails-admin-panel.herokuapp.com/)

![Login screen for admin panel](/public/rails-admin-panel-login.png)

Demo login (with administrator privileges):

- Email: kevin.lee@gmail.com
- Password: password

Demo login (with non-administrator privileges):

- Email: aschmidt73@school.edu
- Password: password

Built with:

- Ruby on Rails
- Bootstrap 4

Notable gems used:

- [Devise](https://github.com/plataformatec/devise): User authentication.
- [Rolify](https://github.com/RolifyCommunity/rolify): Assign roles to users.
- [Pundit](https://github.com/varvet/pundit): Restrict/grant access based on roles.

Four manageable groups:

- Courses
- Cohorts
- Instructors
- Students

The administrator is able to create, read, update, and delete any item in any group.\
There is no option to create a user, since this admin panel is influenced by existing admin panels such as <a href="https://www.blackboard.com/index.html">Blackboard</a>.

seeds.rb is configured to create:

- One administrator
- 5 Courses
- 6 Cohorts (1 for each course, and one extra)
- 5 Instructors
- 100 Students