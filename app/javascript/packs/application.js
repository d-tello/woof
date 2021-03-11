// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import {initChatroomChannel} from 'channels/chatroom_channel.js';
// import { initSelect2 } from '../components/init_select2';
import { launchModal } from '../components/Modal';
import { hideAlert } from '../components/alert'
import { toggleActivatesHiddenButton } from '../components/toggle'

import { initMapbox } from '../plugins/init_mapbox';

import { changeDogPark } from '../components/change_dog_park.js'

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { sendMessageWithEnter } from '../components/chatroom_submit';

document.addEventListener('turbolinks:load', () => {
 initChatroomChannel()
  // initSelect2();
  launchModal();
  $(".alert" ).fadeOut(3000);
  hideAlert();
  toggleActivatesHiddenButton();
  initMapbox();
  changeDogPark();
  initUpdateNavbarOnScroll();
  sendMessageWithEnter();
});

