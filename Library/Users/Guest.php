<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor. */

namespace Library\Users;

 // Declaring a class 

        class Guest {

//      Creating properties within the class.            
            private $first_name;
            private $last_name;
            
            
//      Creating methods  
//      add method for Guest to search allowed tables.
            function full_name(){
                return "$this->first_name" . " " . $this->last_name . "\n";
            }
            function view($list) {
                return $list;
            }
            
            function search($list, $item){
                for ($i = 0; $i < count($list); $i++){
                    if ($list[$i] == $item){
                        echo($list[$i]);
                    } else
                        {
                        echo "Item not available \n";
                    }
                        
                }
            }
        }
