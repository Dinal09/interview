<?php

namespace App\Http\Controllers;

use App\Models\userModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class userController extends Controller
{
    public function index()
    {
        $data = DB::select(
            'call getAllUser()'
        );

        $result = [
            'code' => 200,
            'status' => 'success',
            'data' => $data,
        ];

        return json_encode($result);
    }

    public function selectbyId($id)
    {
        $data = DB::select(
            'call getUserById(?)',
            array($id),
        );
        if ($data == null) {
            $result = [
                'code' => 200,
                'status' => 'success',
                'message' => 'Data Tidak Ditemukan',
                'data' => $data,
            ];
        } else {
            $result = [
                'code' => 200,
                'status' => 'success',
                'message' => 'Data Berhasil Ditampilkan',
                'data' => $data,
            ];
        }

        return json_encode($result);
    }


    public function create(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'username' => 'required',
            'email' => 'required|unique:user,email',
            'password' => 'required|min:5',
        ]);
        if ($validate->fails()) {
            $result = [
                'code' => 401,
                'status' => 'error',
                'message' => 'Data User Tidak Berhasil Ditambahkan',
            ];
        } else {
            DB::select(
                'call createUser(?,?,?)',
                array($request->username, $request->email, $request->password),
            );

            $result = [
                'code' => 200,
                'status' => 'success',
                'message' => 'Data User Berhasil Ditambahkan',
            ];
        }

        return json_encode($result);
    }

    public function update(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'username' => 'required',
            'email' => 'required|unique:user,email',
            'password' => 'required|min:5',
        ]);
        if ($validate->fails()) {
            $result = [
                'code' => 401,
                'status' => 'error',
                'message' => 'Data User Tidak Berhasil Diubah',
            ];
        } else {
            DB::select(
                'call updateUser(?,?,?,?)',
                array($request->id_user, $request->username, $request->email, $request->password),
            );

            $result = [
                'code' => 200,
                'status' => 'success',
                'message' => 'Data User Berhasil Diubah',
            ];
        }

        return json_encode($result);
    }

    public function delete($id)
    {
        $data = DB::select(
            'call deleteUser(?)',
            array($id),
        );

        $result = [
            'code' => 200,
            'status' => 'success',
            'message' => 'Data User Berhasil Dihapus',
        ];

        return json_encode($result);
    }
}
