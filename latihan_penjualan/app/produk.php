<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
class produk extends Model
{
protected $guarded = ['id','created_at','upadated_at'];
public function kategori()
{
return $this->hasOne('App\kategori', 'id', 'id_kategori');
}
}