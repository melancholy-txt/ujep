var handler = new ChatHandler();
handler.SetNext(new DocumentHandler());
await handler.Handle("top 10 cars in the world");