<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Produto extends Model
{
    protected $fillable = ['categoria_id', 'nome', 'sku', 'preco', 'estoque'];

    protected $casts = [
        'preco' => 'decimal:2',
        'estoque' => 'integer',
    ];

    /** O produto pertence a uma categoria (N:1). */
    public function categoria(): BelongsTo
    {
        return $this->belongsTo(Categoria::class);
    }
}
