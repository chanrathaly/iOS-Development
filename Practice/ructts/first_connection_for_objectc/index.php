<?php
    include("classes/functions.php");
    $obj = new functions;
    $obj->connect_db();

    $action = $_GET["action"];

    switch ($action) {
        case "register_employee":
            $emp_data = array(
                'fn'=>mysql_real_escape_string($_GET["fn"]),
                'ln'=>mysql_real_escape_string($_GET["ln"]),
                'sex'=>  mysql_real_escape_string($_GET["sex"]),
                'dob'=>  mysql_real_escape_string($_GET["dob"]),
                'email'=>  mysql_real_escape_string($_GET["email"]),
                'pwd'=>  mysql_real_escape_string($_GET["pwd"]),
                'role'=>  mysql_real_escape_string($_GET["role"]),
                'status'=>  mysql_real_escape_string($_GET["status"])
            );
            $obj->register_employee($emp_data);
            break;
	case "edit_emp":
            $emp_data = array(
                'emp_id'=>$_GET["emp_id"],
                'fn'=>mysql_real_escape_string($_GET["fn"]),
                'ln'=>mysql_real_escape_string($_GET["ln"]),
                'sex'=>  mysql_real_escape_string($_GET["sex"]),
                'dob'=>  mysql_real_escape_string($_GET["dob"]),
                'email'=>  mysql_real_escape_string($_GET["email"]),
                'role'=>  mysql_real_escape_string($_GET["role"]),
                'status'=>  mysql_real_escape_string($_GET["status"])
            );
            $obj->edit_employee($emp_data);
            break;
        case "login":
            $email = mysql_real_escape_string($_GET["email"]);
            $pwd = mysql_real_escape_string($_GET["pwd"]);
            $obj->check_login($email, $pwd);
            break;
        case "get_employee_list":
            $obj->get_employee_list();
            break;
        case "get_action_done_list":
            $obj->get_action_done_list($_GET["emp_role"], $_GET["emp_id"]);
            break;
        case "new_action_done":
            $action_done = array(
                'emp_id'=>$_GET["emp_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->add_action_done($action_done);
            break;
        case "edit_action_done":
            $action_done = array(
                'ad_id'=>$_GET["ad_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->edit_action_done($action_done);
            break;
       case "get_action_plan_list":
           $obj->get_action_plan_list($_GET["emp_role"], $_GET["emp_id"]);
           break;
       case "new_action_plan":
           $action_plan = array(
                'emp_id'=>$_GET["emp_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->add_action_plan($action_plan);
           break;
       case "edit_action_plan":
           $action_plan = array(
                'ap_id'=>$_GET["ap_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->edit_action_plan($action_plan);
           break;
       case "get_problem_comment_list":
           $obj->get_problem_comment_list($_GET["emp_role"], $_GET["emp_id"]);
           break;
       case "new_problem_comment":
           $problem_comment = array(
                'emp_id'=>$_GET["emp_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->add_problem_comment($problem_comment);
           break;
       case "edit_aproblem_comment":
           $problem_comment = array(
                'pc_id'=>$_GET["pc_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->edit_problem_comment($problem_comment);
           break;
       case "get_suggestion_list":
           $obj->get_suggestion_list($_GET["emp_role"], $_GET["emp_id"]);
           break;
       case "new_suggestion":
           $suggestion = array(
                'emp_id'=>$_GET["emp_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->add_suggestion($suggestion);
           break;
       case "edit_suggestion":
           $suggestion = array(
                'sug_id'=>$_GET["sug_id"],
                'title'=>  mysql_real_escape_string($_GET["title"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->edit_suggestion($suggestion);
           break;
       case "get_department_list":
           $obj->get_department_list();
           break;
       case "new_department":
           $department = array(
                'dep_name'=>  mysql_real_escape_string($_GET["dep_name"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->add_department($department);
           break;
       case "edit_department":
           $department = array(
                'dep_id'=>$_GET["dep_id"],
                'dep_name'=>  mysql_real_escape_string($_GET["dep_name"]),
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->edit_department($department);
           break;
       case "get_team_list":
           $obj->get_team_list();
           break;
       case "new_team":
           $team = array(
                'team_name'=>  mysql_real_escape_string($_GET["team_name"]),
                'dep_name'=>  $_GET["dep_name"],
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->add_team($team);
           break;
       case "edit_team":
           $team = array(
                'team_id'=>$_GET["team_id"],
                'team_name'=>  mysql_real_escape_string($_GET["team_name"]),
                'dep_name'=>$_GET["dep_name"],
                'description'=>  mysql_real_escape_string($_GET["description"])
            );
            $obj->edit_team($team);
           break;
       default :
            echo "default case";
    }
    mysql_close();
?>