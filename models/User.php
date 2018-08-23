<?php
class User{
    private $id_user;
    private $cod_user_type;
    private $level_user;
    private $cod_train_area;
    private $cod_know_area;
    private $name_user;
    private $genre_user;
    private $year_user;
    private $month_user;
    private $day_user;
    private $document_user;
    private $cod_doc_type;
    private $email_user;
    private $pass_user;
    private $confirm_user;
    private $cellphone_user;
    private $phone_user;
    private $cod_country;
    private $cod_state;
    private $cod_city;
    private $cod_comunne;
    private $cod_neighb;
    private $cod_town;
    private $cod_village;
    private $address_user;
    private $created_user_at;
    private $updated_user_at;

    public function getId_user(){
    return $this->id_user;
  }
    public function setId_user($id_user){
      $this->id_user = $id_user;
    }
    public function getCod_user_type(){
      return $this->cod_user_type
    }
    public function setCod_user_type($cod_user_type){
      $this->cod_user_type = $cod_user_type;
    }
    public function getLevel_user(){
    return $this->level_user;
  }
    public function setLevel_user($level_user){
      $this->leve_user = $level_user;
    }
    public function getCod_train_area(){
      return $this->cod_train_area
    }
    public function setCod_train_area($cod_train_area){
      $this->cod_train_area = $cod_train_area;
    }
    public function getCod_know_area(){
    return $this->cod_know_area;
  }
    public function setCod_know_area($cod_know_area){
      $this->cod_know_area = $cod_know_area;
    }
    public function getName_user(){
      return $this->name_user
    }
    public function setName_user($name_user){
      $this->name_user = $name_user;
    }
    public function getGenre_user(){
    return $this->genre_user;
  }
    public function setGenre_user($genre_user){
      $this->genre_user = $genre_user;
    }
    public function getCod_user_type(){
      return $this->cod_user_type
    }
    public function setCod_user_type($cod_user_type){
      $this->cod_user_type = $cod_user_type;
    }
}
