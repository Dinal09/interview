<?php

use App\Http\Controllers\userController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('user_all', [userController::class, 'index']);
Route::get('user_by_id/{id}', [userController::class, 'selectById']);
Route::post('create_user', [userController::class, 'create']);
Route::post('update_user', [userController::class, 'update']);
Route::get('delete_user/{id}', [userController::class, 'delete']);
