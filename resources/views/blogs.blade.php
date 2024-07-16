<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Create Blog Post</title>
</head>

<body>
    <h2>Create Blog Post</h2>

    @auth
        <p>Welcome, {{ auth()->user()->name }}</p>
        <!-- Logout form -->
        <form action="/api/logout" method="POST">
            @csrf
            <button type="submit">Logout</button>
        </form>
    @else
        <!-- Login form  -->
        <a href="/login">Login</a>
        <!-- Register form -->
        <a href="/register">Register</a>
    @endauth

    <form action="/api/store" method="POST">
        @csrf
        <label for="title">Title:</label><br>
        <input type="text" id="title" name="title"><br><br>

        <label for="content">Content:</label><br>
        <textarea id="content" name="content"></textarea><br><br>

        <button type="submit">Create Post</button>
    </form>

    <h2>Blog Posts</h2>
    <ul id="blog-list">
    </ul>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            fetchBlogPosts();
        });


        const fetchBlogPosts = () => {
            axios.get('http://localhost:8000/api/get_blogs')
                .then(function (response) {
                    // Handle success: Update the DOM with blog posts
                    const blogs = response.data;

                    // Clear previous list items
                    document.getElementById('blog-list').innerHTML = '';

                    // Append new list items
                    blogs.forEach(function (post) {
                        const li = document.createElement('li');
                        li.innerHTML = `
                            <h3>${post.title}</h3>
                            <p>${post.content}</p>
                            @auth
                            <a href="/blog/${post.id}">Edit</a>
                            <form id="delete-form-${post.id}" action="/api/delete/${post.id}" method="post">
                            @csrf
                            @method('DELETE')
                            <button type="button" onclick="confirmDelete(${post.id})">Delete</button>
                            </form>
                            @else
                            <p>Login to edit or delete this post</p>
                            @endauth



                        `;
                        document.getElementById('blog-list').appendChild(li);
                    });
                })
                .catch(function (error) {
                    // Handle error: Log the error or show a message to the user
                    console.error('Error fetching blog posts:', error);
                });
        }

        const confirmDelete = (postId) => {
            if (confirm('Are you sure you want to delete this post?')) {
                document.getElementById(`delete-form-${postId}`).submit();
            }
        }

    </script>
</body>

</html>
