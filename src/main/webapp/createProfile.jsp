<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Profile</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #d891ef;
        }
        .container {
            margin-top: 50px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .skills-list {
            list-style-type: none;
            padding-left: 0;
        }
        .skills-list li {
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 5px;
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .btn-primary {
            background-color: #d891ef; /* Set button color */
            border: none;
            color: white; /* Ensure text is readable */
        }
        .btn-primary:hover {
            background-color: #b06abf; /* Slightly darker shade on hover */
            color: white;
        }
    </style>
    <script>
        function validateForm() {
            const fields = ['fullName', 'email', 'phone', 'address', 'education', 'experience', 'linkedin', 'dob', 'cgpa', 'backlogs', 'enrollmentYear', 'passoutYear', 'sex'];
            for (let field of fields) {
                if (document.forms["profileForm"][field].value === "") {
                    alert(field + " must be filled out.");
                    return false;
                }
            }
            const skills = document.getElementById('selectedSkills');
            if (skills.value === "") {
                alert("Skills must be selected.");
                return false;
            }
            return true;
        }

        function addSkill() {
            const skillSelect = document.getElementById('skills');
            const selectedSkill = skillSelect.options[skillSelect.selectedIndex].value;
            if (selectedSkill !== "" && !document.getElementById('skill-' + selectedSkill)) {
                const skillsContainer = document.getElementById('skillsContainer');
                const skillItem = document.createElement('li');
                skillItem.id = 'skill-' + selectedSkill;
                skillItem.innerHTML = selectedSkill + ' <button type="button" class="close" onclick="removeSkill(\'' + selectedSkill + '\')">&times;</button>';
                skillsContainer.appendChild(skillItem);

                const hiddenSkillsInput = document.getElementById('selectedSkills');
                hiddenSkillsInput.value += (hiddenSkillsInput.value ? ',' : '') + selectedSkill;
            }
        }

        function removeSkill(skill) {
            const skillItem = document.getElementById('skill-' + skill);
            skillItem.remove();

            const hiddenSkillsInput = document.getElementById('selectedSkills');
            const skillsArray = hiddenSkillsInput.value.split(',');
            const skillIndex = skillsArray.indexOf(skill);
            if (skillIndex > -1) {
                skillsArray.splice(skillIndex, 1);
            }
            hiddenSkillsInput.value = skillsArray.join(',');
        }
    </script>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Create Your Profile</h2>
        <form name="profileForm" action="CreateProfileServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>
            <div class="form-group">
                <label for="education">Education</label>
                <input type="text" class="form-control" id="education" name="education" required>
            </div>
            <div class="form-group">
                <label for="experience">Professional Experience</label>
                <textarea class="form-control" id="experience" name="experience" rows="4" required></textarea>
            </div>
            <div class="form-group">
                <label for="skills">Skills</label>
                <div class="input-group">
                    <select class="form-control" id="skills" name="skills">
                        <option value="">Select Skill</option>
                        <option value="C">C</option>
                        <option value="Java">Java</option>
                        <option value="Python">Python</option>
                        <option value="HTML">HTML</option>
                        <option value="CSS">CSS</option>
                        <option value="JavaScript">JavaScript</option>
                        <option value="React">React</option>
                        <option value="Node.js">Node.js</option>
                        <option value="Angular">Angular</option>
                        <option value="SQL">SQL</option>
                    </select>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-outline-secondary" onclick="addSkill()">Add</button>
                    </div>
                </div>
                <ul class="skills-list" id="skillsContainer"></ul>
                <input type="hidden" id="selectedSkills" name="selectedSkills" value="">
            </div>
            <div class="form-group">
                <label for="linkedin">LinkedIn Profile</label>
                <input type="url" class="form-control" id="linkedin" name="linkedin" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="cgpa">Current CGPA</label>
                <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" min="0" max="10" required>
            </div>
            <div class="form-group">
                <label for="backlogs">Backlogs</label>
                <input type="number" class="form-control" id="backlogs" name="backlogs" min="0" required>
            </div>
            <div class="form-group">
                <label for="enrollmentYear">Enrollment Year</label>
                <input type="number" class="form-control" id="enrollmentYear" name="enrollmentYear" min="1900" max="2099" required>
            </div>
            <div class="form-group">
                <label for="passoutYear">Passout Year</label>
                <input type="number" class="form-control" id="passoutYear" name="passoutYear" min="1900" max="2099" required>
            </div>
            <div class="form-group">
                <label for="sex">Sex</label>
                <select class="form-control" id="sex" name="sex" required>
                    <option value="">Select Sex</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
