<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of functions
 *
 * @author apple
 */
class functions {
    //put your code here

    function connect_db () {
        mysql_connect("localhost","root","root") or die(mysql_error());
        mysql_select_db("ruc_tts") or die(mysql_error());
    }

    function register_employee ($emp_data) {
        mysql_query("INSERT INTO employees (first_name,last_name,sex,dob,email,password,role,status) VALUES ('".$emp_data["fn"]."','".$emp_data["ln"]."','".$emp_data["sex"]."','".$emp_data["dob"]."','".$emp_data["email"]."','".$emp_data["pwd"]."','".$emp_data["role"]."','".$emp_data["status"]."')") or die(mysql_error());
    }

    function edit_employee ($emp_data) {
        mysql_query("UPDATE employees SET first_name='".$emp_data["fn"]."', last_name='".$emp_data["ln"]."', sex='".$emp_data["sex"]."', dob='".$emp_data["dob"]."', email='".$emp_data["email"]."', role='".$emp_data["role"]."', status='".$emp_data["status"]."' WHERE id=".$emp_data["emp_id"]) or die(mysql_error());
    }

    function check_login ($email, $pwd) {
        $email = mysql_real_escape_string($email);
        $pwd = mysql_real_escape_string($pwd);
        $user = mysql_query("SELECT * FROM employees WHERE email='$email' AND password='".md5($pwd)."'") or die(mysql_error());
        $count_user = mysql_num_rows($user);
        if ($count_user > 0) {
            $user_data = mysql_fetch_assoc($user);
            echo json_encode($user_data);
        } else echo "";
    }

    function get_employee_list () {
        $employees = mysql_query("SELECT * FROM employees ORDER BY first_name ASC");
        while ($employee = mysql_fetch_assoc($employees)) {
            $employee_list[] = $employee;
        }
        echo json_encode($employee_list);
    }
    
    function get_action_done_list ($emp_role, $emp_id) {
        $action_dones = "";
        if ($emp_role == "Admin") {
            $action_dones = mysql_query ("SELECT ad.*,emp.email,CONCAT(emp.first_name,'.',emp.last_name) AS emp_name FROM action_dones ad INNER JOIN employees emp ON ad.emp_id=emp.id ORDER BY ad.ad_date DESC") or die(mysql_error());
        } else {
            $action_dones = mysql_query ("SELECT * FROM action_dones WHERE emp_id=".$emp_id." ORDER BY ad_date DESC") or die(mysql_error());
        }
        while ($action_done = mysql_fetch_assoc($action_dones)) {
            $action_done_list[] = $action_done;
        }
        echo json_encode($action_done_list);
    }
    
    function add_action_done ($action_done) {
        mysql_query("INSERT INTO action_dones (ad_title,ad_description,ad_date,emp_id) VALUES ('".$action_done["title"]."','".$action_done["description"]."','".date('Y-m-d')."',".$action_done["emp_id"].")") or die(mysql_error());
    }
    
    function edit_action_done ($action_done) {
        mysql_query("UPDATE action_dones SET ad_title='".$action_done["title"]."',ad_description='".$action_done["description"]."' WHERE id=".$action_done["ad_id"]) or die(mysql_error());
    }
    
    function get_action_plan_list ($emp_role, $emp_id) {
        $action_plans = "";
        if ($emp_role == "Admin") {
            $action_plans = mysql_query ("SELECT ap.*,emp.email,CONCAT(emp.first_name,'.',emp.last_name) AS emp_name FROM action_plans ap INNER JOIN employees emp ON ap.emp_id=emp.id ORDER BY ap.ap_date DESC") or die(mysql_error());
        } else {
            $action_plans = mysql_query ("SELECT * FROM action_plans WHERE emp_id=".$emp_id." ORDER BY ap_date DESC") or die(mysql_error());
        }
        while ($action_plan = mysql_fetch_assoc($action_plans)) {
            $action_plan_list[] = $action_plan;
        }
        echo json_encode($action_plan_list);
    }
    
    function add_action_plan ($action_plan) {
        mysql_query("INSERT INTO action_plans (ap_title,ap_description,ap_date,emp_id) VALUES ('".$action_plan["title"]."','".$action_plan["description"]."','".date('Y-m-d')."',".$action_plan["emp_id"].")") or die(mysql_error());
    }
    
    function edit_action_plan ($action_plan) {
        mysql_query("UPDATE action_plans SET ap_title='".$action_plan["title"]."',ap_description='".$action_plan["description"]."' WHERE id=".$action_plan["ap_id"]) or die(mysql_error());
    }
    
    function get_problem_comment_list ($emp_role, $emp_id) {
        $problem_comments = "";
        if ($emp_role == "Admin") {
            $problem_comments = mysql_query ("SELECT pro.*,emp.email,CONCAT(emp.first_name,'.',emp.last_name) AS emp_name FROM problem_comments pro INNER JOIN employees emp ON pro.emp_id=emp.id ORDER BY pro.pc_date DESC") or die(mysql_error());
        } else {
            $problem_comments = mysql_query ("SELECT * FROM problem_comments WHERE emp_id=".$emp_id." ORDER BY pc_date DESC") or die(mysql_error());
        }
        while ($problem_comment = mysql_fetch_assoc($problem_comments)) {
            $problem_comment_list[] = $problem_comment;
        }
        echo json_encode($problem_comment_list);
    }
    
    function add_problem_comment ($problem_comment) {
        mysql_query("INSERT INTO problem_comments (pc_title,pc_description,pc_date,emp_id) VALUES ('".$problem_comment["title"]."','".$problem_comment["description"]."','".date('Y-m-d')."',".$problem_comment["emp_id"].")") or die(mysql_error());
    }
    
    function edit_problem_comment ($problem_comment) {
        mysql_query("UPDATE problem_comments SET pc_title='".$problem_comment["title"]."',pc_description='".$problem_comment["description"]."' WHERE id=".$problem_comment["pc_id"]) or die(mysql_error());
    }
    
    function get_suggestion_list ($emp_role, $emp_id) {
        $suggestions = "";
        if ($emp_role == "Admin") {
            $suggestions = mysql_query ("SELECT sug.*,emp.email,CONCAT(emp.first_name,'.',emp.last_name) AS emp_name FROM suggestions sug INNER JOIN employees emp ON sug.emp_id=emp.id ORDER BY sug.sug_date DESC") or die(mysql_error());
        } else {
            $suggestions = mysql_query ("SELECT * FROM suggestions WHERE emp_id=".$emp_id." ORDER BY sug_date DESC") or die(mysql_error());
        }
        while ($suggestion = mysql_fetch_assoc($suggestions)) {
            $suggestion_list[] = $suggestion;
        }
        echo json_encode($suggestion_list);
    }
    
    function add_suggestion ($suggestion) {
        mysql_query("INSERT INTO suggestions (sug_title,sug_description,sug_date,emp_id) VALUES ('".$suggestion["title"]."','".$suggestion["description"]."','".date('Y-m-d')."',".$suggestion["emp_id"].")") or die(mysql_error());
    }
    
    function edit_suggestion ($suggestion) {
        mysql_query("UPDATE suggestions SET sug_title='".$suggestion["title"]."',sug_description='".$suggestion["description"]."' WHERE id=".$suggestion["sug_id"]) or die(mysql_error());
    }
    
    function get_department_list () {
        $departments = mysql_query("SELECT * FROM departments ORDER BY dep_name ASC");
        while ($department = mysql_fetch_assoc($departments)) {
            $department_list[] = $department;
        }
        echo json_encode($department_list);
    }
    
    function add_department ($department) {
        mysql_query("INSERT INTO departments (dep_name,dep_description) VALUES ('".$department["dep_name"]."','".$department["description"]."')") or die(mysql_error());
    }
    
    function edit_department ($department) {
        mysql_query("UPDATE departments SET dep_name='".$department["dep_name"]."',dep_description='".$department["description"]."' WHERE id=".$department["dep_id"]) or die(mysql_error());
    }
    
    function get_team_list () {
        $teams = mysql_query("SELECT t.*,dep.dep_name FROM teams t INNER JOIN departments dep ON t.dep_id=dep.id ORDER BY t.team_name ASC");
        while ($team = mysql_fetch_assoc($teams)) {
            $team_list[] = $team;
        }
        echo json_encode($team_list);
    }

    function add_team ($team) {
        $dep = mysql_query("SELECT id FROM departments WHERE dep_name='".$team["dep_name"]."'") or die(mysql_error());
        $dep_data = mysql_fetch_assoc($dep);
        mysql_query("INSERT INTO teams (team_name,team_description,dep_id) VALUES ('".$team["team_name"]."','".$team["description"]."',".$dep_data["id"].")") or die(mysql_error());
    }
    
    function edit_team ($team) {
        $dep = mysql_query("SELECT id FROM departments WHERE dep_name='".$team["dep_name"]."'") or die(mysql_error());
        $dep_data = mysql_fetch_assoc($dep);
        mysql_query("UPDATE teams SET team_name='".$team["team_name"]."',team_description='".$team["description"]."',dep_id=".$dep_data["id"]." WHERE id=".$team["team_id"]) or die(mysql_error());
    }
}

?>