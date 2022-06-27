<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Carbon\Carbon;

class Post extends Model
{
    use HasFactory;
    use Sluggable;

    const IS_DRAFT = 0;
    const IS_PUBLIC = 1;

    protected $fillable = ['title', 'content','date','description'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class,'user_id');
    }
    public function tags()
    {
        return $this->belongsToMany(
          Tag::class,
          'post_tags',
            'post_id',
            'tag_id'
        );
    }
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public  function  sluggable (): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public static function add($fields)
    {
        $post = new static;
        $post->fill($fields);
        $post->user_id = 1;
        $post->save();

        return $post;
    }

    public function edit($fields)
    {
        $this->fill($fields);
        $this->save();
    }

    public function remove()
    {
        //удалить кртинку поста
        Storage::delete('uploads/' . $this->image);         //при удалении поста удаляем картинку
        $this->delete();
    }

    public function uploadImage($image)
    {
        if($image == null) { return ; }                         // проверяем наличие картинки
        Storage::delete('uploads/' . $this->image);         //удаляем предыдущую картинку
        $filename = Str::random(10) . '.' . $image->extension(); // генерируем название файла
        $image->storeAs('uploads', $filename);                    // сохраняем файл в папку uploads
        $this->image = $filename;                               // закидываем это значение в наше полке image
        $this->save();                                          // сохраняем картинку

    }

    // метод для вывода картинки
     public function getImage()
     {
         //выводим дефолтную катринку если нет картинки
         if($this->image == null)
         {
             return '/img/no-image.png';
         }
            return '/uploads/' . $this->image;

     }

     // установим привязку поста к категории
    public function setCategory($id)
    {
        if($id == null) { return; }
        $this->category_id = $id;
        $this->save();
    }

      // здесь будет массив айдишников подвязаных к посту
    public function setTags($ids)
    {
        if($ids == null) { return; }
        // синхронизируем с данными айдишниками нашу статью
        $this->tags()->sync($ids);    // старые айдишники удаляются - новые пишем.

    }

    // метод в черновик статью пишем
     public function setDraft()
     {
         $this->status = Post::IS_DRAFT;
         $this->save();
     }

    // метод статью публикуем
    public function setPublic()
    {
        $this->status = Post::IS_PUBLIC;
        $this->save();
    }

    // переключатель статуса статьи
    public function toggleStatus($value)
    {
        if($value == null)
        {
           return $this->setDraft();
        }
        else
        {
           return $this->setPublic();
        }
    }


    // метод в рекомендованые статью пишем
    public function setFeatured()
    {
        $this->is_featured = 1;
        $this->save();
    }

    // метод статью публикуем
    public function setStandart()
    {
        $this->is_featured = 0;
        $this->save();
    }

    // переключатель рекондация статьи
    public function toggleFeatured($value)
    {
        if($value == null)
        {
            return $this->setStandart();
        }
        else
        {
            return $this->setFeatured();
        }
    }


    public function setDateAttribute($value)
    {
            $date = Carbon::createFromFormat('d/m/y', $value)->format('Y-m-d');
            $this->attributes['date'] = $date;
    }
    public function getDateAttribute($value)
    {
        $date = Carbon::createFromFormat('Y-m-d', $value)->format('d/m/y');

        return $date;
    }

    public function getCategoryTitle()
    {
        return ($this->category != null)
            ?   $this->category->title
            :   'Нет категории';
    }

    public function getTagsTitles()
    {
        return (!$this->tags->isEmpty())
            ?   implode(', ', $this->tags->pluck('title')->all())
            : 'Нет тегов';
    }

    public function getCategoryID()
    {
        return $this->category != null ? $this->category->id : null;
    }

    public function getDate()
    {
        return Carbon::createFromFormat('d/m/y', $this->date)->format('F d, Y');
    }

    public function hasPrevious()
    {
        return self::where('id', '<', $this->id)->max('id');
    }

    public function getPrevious()
    {
        $postID = $this->hasPrevious(); //ID

        return self::find($postID);
    }

    public function hasNext()
    {
        return self::where('id', '>', $this->id)->min('id');
    }

    public function getNext()
    {
        $postID = $this->hasNext();

        return self::find($postID);
    }

    public function related()
    {
        return self::all()->except($this->id);
    }

    public function hasCategory()
    {
        return $this->category != null ? true : false;
    }

    public static function getPopularPosts()
    {
        return self::orderBy('views','desc')->take(3)->get();
    }

    public function getComments()
    {
        return $this->comments()->where('status', 1)->get();
    }

}
