<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Categoria extends Model
{
    protected $fillable = ['nome', 'descricao'];

    /** Uma categoria possui muitos produtos (1:N). */
    public function produtos(): HasMany
    {
        return $this->hasMany(Produto::class);
    }
}
