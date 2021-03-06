// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import { animation } from "../components/title";
import { greeting } from "../components/subjects";
import { editSubjects } from "../components/teacherEdit";
import { assignClass } from "../components/assignClass";
import { addStudents } from "../components/addStudents";

document.addEventListener('turbolinks:load', () => {
  const letters = document.querySelector(".text-wrapper");
  var textWrapper = document.querySelector('.ml16');
  const teacherHome = document.querySelector('.teacher-btn-main');
  const question = document.querySelector(".yes-no");
  const studentForm = document.querySelector(".single-input");

  if (textWrapper) {
    animation();
  }

  if (letters) {
    greeting();
  }

  if (teacherHome) {
    editSubjects();
  }

  if (question) {
    assignClass();
  }

  if (studentForm) {
    addStudents();
  }
});
