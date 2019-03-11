<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Member extends Guest {
//      Creating properties within the class.
            private $user_id;
            private $password;

//      Creating methods        
            function Forgot_user_id(){
                return "Hello " . $this->Full_Name() . "Your User ID is: " . $this->user_id . "<br/>";
            }
            
            function Forgot_password(){
                return "Hello " . $this->Full_Name() . "Your Password is: " . $this->password . "<br/>";
            }
            
            function Update_Due_Date($date, $days){
                if($days > 7) {
                    return "You can only extend due date by 7 days";
                } else {
                    $date = strtotime("+".$days." days", strtotime($date));     
                    return  date("Y-m-d", $date); 
                    }
                }
        }
