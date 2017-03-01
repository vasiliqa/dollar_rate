# README

##Requirements

* The application contains two pages: `/` and `/admin`.
* The root page displays the current dollar-ruble exchange rate, which is known to application.
* The app periodically updates rate from any selected available source (CBR-website, a main page http://www.rbc.ru, etc) using a background script.
* The rate updates on all currently opened root pages when it updates inside the application.
* The form is located on the `/admin` page. It contains field for input a number, field for input
a date-time and a submit button.
* Submitted number becomes a forced rate until the entered date-time, i.e. the real rate is ignored
until that time, and the root pages display the forced rate instead of it.
* The `/admin` page 'remembers' last input and displays it on the page load.
* Forced rate updates on all currently opened root pages when you submit it. All root pages start to
display the real rate when the forced rate expires.
* The form contains reasonable validations.
* The appearance of the application must be tidy within a reasonable (eg, on Twitter Bootstrap).
* Any client-side JS-framework would be a plus.
* The app must work correctly in the latest versions of Firefox and Chrome.
* The code must be covered by the tests.
* Everything you need to run the application locally should be formed into the Procfile for Foreman.
