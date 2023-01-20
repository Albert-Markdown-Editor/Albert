SELECT
    CASE
        WHEN books.id IS NOT NULL THEN 'Book'
        WHEN blog_posts.id IS NOT NULL THEN 'BlogPost'
    END as kind,
    COALESCE(books.id, blog_posts.id) as id,
    COALESCE(books.name, blog_posts.name) as name,
    COALESCE(books.summary, blog_posts.summary) as summary,
    COALESCE(books.release_date, blog_posts.release_date) as release_date,
    COALESCE(books.project_id, blog_posts.project_id) as project_id
FROM books NATURAL FULL OUTER JOIN blog_posts;
