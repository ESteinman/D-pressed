// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function handleRating(path) {
    let ratingButtons = document.querySelectorAll('button')
    let noticeDiv = document.querySelector('.notice')
    let alertDiv = document.querySelector('.alert')
    let ratingDiv = document.querySelector('#rating')
    ratingButtons.forEach((button) => {
        button.addEventListener('click', (event) => {
            event.preventDefault()
            let value = button.dataset.rating
            let body = JSON.stringify({ rating: value })
            fetch(path, {
                method: 'POST',
                body: body,
                credentials: 'include',
                headers: {
                    'Content-Type': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-Token': Rails.csrfToken()
                }
            }).then(function (response) {
                return response.json();
            }).then(function (data) {
                noticeDiv.innerHTML = data.message
                ratingDiv.style.display = 'none'
            }).catch((error) => {
                alertDiv.innerHTML = data.error
            });
        })
    })
}

