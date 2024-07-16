<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewBlogNotification extends Notification
{
    use Queueable;


    /**
     * Create a new notification instance.
     */
    protected $blogPost;

    public function __construct($blogPost)
    {
        $this->blogPost = $blogPost;
    }
    

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via($notifiable)
    {
        return ['mail'];
    }
    

    /**
     * Get the mail representation of the notification.
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('New Blog Post Created: ' . $this->blogPost['title'])
                    ->line('A new blog post titled "'.$this->blogPost['title'].'" has been published on our website.')
                    ->action('View Blog Post', url('/posts/' . $this->blogPost['id']))
                    ->line('Thank you for using our application!');
    }
    

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray($notifiable)
    {
        return [
            'title' => $this->blogPost['title'],
            'link' => url('/posts/' . $this->blogPost['id']),
        ];
    }
    
}
