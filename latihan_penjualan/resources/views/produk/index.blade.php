@extends('layouts.app') @section('content')
<div class="container">
<div class="row">
<div class="col-md-12">
<div class="panel panel-default">
<div class="panel-head container-fluid" style="margin-top: 10px;">
<a href="{{ route('produk.create') }}" class="btn btn-
primary">Tambah Produk</a>
<div class="pull-right">
<p>Data produk</p>
</div>
</div>
<div class="panel-body">
<table class="table table-striped">
<thead>
<tr>
<th>No</th>
<th>Nama</th>
<th>Kategori</th>
<th>Qty</th>
<th>Harga Beli</th>
<th>Harga Jual</th>
<th>Dibuat Pada</th>
<th>Diedit Pada</th>
<th colspan="3"
style="text-align:
center;">Aksi</th>
</tr>
</thead>
<tbody>
@foreach ($produk as $i => $p)
<tr>
<td>{{ $i+1 }}</td>
<td>{{ $p->nama }}</td>
<td>{{ $p->Kategori->nama }}</td>
<td>{{ $p->qty }}</td>
<td>{{ $p->harga_beli }}</td>
<td>{{ $p->harga_jual }}</td>
<td>{{ $p->created_at }}</td>
<td>{{ $p->updated_at }}</td>
<td><a route(produk.show,$p->id) }}" class="btn btn-warning"> Detail</a></td>
<td><a class="btn
href="{{ route(produk.edit,$p->id) }}"> Edit</a></td>
<td>
<form
action="{{ route('produk.destroy',$p->id) }}">
href="{{
btn-success"
method="post"
{{ csrf_field() }}
<input type="hidden"
name="_method" value="DELETE">
<button
class="btn
btn-danger" type="submit">Hapus</button>
</form>
</td>
</tr>
@endforeach
</tbody>
</table>
</div>
</div>
</div>
</div>
</div> @endsection