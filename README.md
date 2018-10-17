# <a href='https://rails-admin-panel.herokuapp.com/'>Admin Panel</a>

Demo login (with administrator privileges):
<ul>
    <li>Email: kevin.lee@gmail.com</li>
    <li>Password: password</li>
</ul>

Demo login (with non-administrator privileges):
<ul>
    <li>Email: aschmidt73@school.edu</li>
    <li>Password: password</li>
</ul>

Built with:
<ul>
    <li>Ruby on Rails</li>
    <li>Bootstrap 4</li>
</ul>

Notable gems used:
<ul>
    <li><a href="https://github.com/plataformatec/devise">Devise</a>: User authentication.</li>
    <li><a href="https://github.com/RolifyCommunity/rolify">Rolify</a>: Assign roles to users.</li>
    <li><a href="https://github.com/varvet/pundit">Pundit</a>: Restrict/grant access based on roles.</li>
</ul>

Four manageable groups:
<ul>
    <li>Courses</li>
    <li>Cohorts</li>
    <li>Instructors</li>
    <li>Students</li>
</ul>

The administrator is able to create, read, update, and delete any item in any group.
There is no option to create a user, since this admin panel is influenced by existing admin panels such as <a href="https://www.blackboard.com/index.html">Blackboard</a>.