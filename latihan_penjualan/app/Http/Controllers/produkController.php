<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class produkController extends Controller
{
    function index()
    {
        $produk = produk::all();
        return view('produk.index');
    }
    function create()
    {
        $kategori = \App\kategori::all();
        return view('produk.create',compact('kategori'));
    }
}