<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Blog Post</title>
</head>
<body>
    <h2>Edit Blog Post ID: {{ $id }}</h2>

    <div id="edit-form">
        <!-- Edit Form -->
        <form id="edit-post-form" action="/api/update/{{ $id }}" method="POST">
            @csrf
            @method('PUT')
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" required><br><br>
            
            <label for="content">Content:</label><br>
            <textarea id="content" name="content" required></textarea><br><br>
            
            <button type="submit">Update Post</button>
        </form>
    </div>


    <!-- Axios CDN for fetching data -->
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            fetchBlogPost();
        });

        const fetchBlogPost = () => {
            axios.get(`http://localhost:8000/api/show/{{ $id }}`)
                .then(function (response) {
                    const post = response.data;
                    // Populate the edit form with retrieved data
                    document.getElementById('title').value = post.title;
                    document.getElementById('content').value = post.content;

                })
                .catch(function (error) {
                    console.error('Error fetching blog post:', error);
                });
        }

       
    </script>
</body>
</html>
