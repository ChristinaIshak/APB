<?php

use Illuminate\Database\Seeder; 
use App\kategori;

class kategoriTableSeeder extends Seeder
{
	/**
	 * Run the database seeds.
	 *
	 * @return void
	 */
public function run()
{
	kategori::create([
		'nama' => 'Makanan'
	]);
	kategori::create([
		'nama' => 'Perlengkapan Rumah Tangga'
	]);
	kategori::create([
		'nama' => 'Alat Belajar'
	]);
	}
}