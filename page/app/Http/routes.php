<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
Route::post('delete_file/', 'ApplicantsController@destroy');
Route::post('get_files/', 'ApplicantsController@applicant_files');

Route::post('multiple_lineup/', 'ApplicantsController@multiple_lineup');
Route::post('get_currency/', 'ApplicantsController@get_currency');

Route::post('delete_user/', 'UserController@destroy');


Route::any('update_pos/', 'ajaxControllel@update_position');

Route::get('/', 'WelcomeController@index');

Route::get('home', 'HomeController@index');

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);

//API
Route::any('cydApi/getApplicantByID/{applicantID}', 'cydapi@getApplicantByID');