<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detailUserModel extends Model
{
    use HasFactory;

    protected $table = 'detail_user';
    protected $fillable = [
        'nama',
        'alamat',
    ];
}
