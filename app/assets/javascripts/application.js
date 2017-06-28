//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


var input = document.getElementsByTagName('input');

keyupHandler = function(input){
    if (input.value == 'red'){
        input.setAttribute('class', 'red');
    }
    else if (input.value == 'yellow'){
        input.setAttribute('class', 'yellow');
    }
    else {
        input.setAttribute('class', 'green');
    }
}

for (i=0; i<input.length; i++){
    input[i].onkeyup = function(){
        keyupHandler(this);
    }
}
