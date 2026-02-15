INSERT INTO [dbo].[User] VALUES
('qwe@qwe.com', 'John', 'qweqwe', '0123456789', 'itdp'),
('admin@admin.com', 'Joyce', 'qweqwe', '0198765432', 'programManager');
Go

INSERT INTO [dbo].[Event] (event_title, event_description, start_time, end_time, venue, is_ended) VALUES
('coding challenge', 'coding challenge by dell', '10/8/2020 2:20:00 PM', '10/9/2020 2:20:00 PM', 'apu campus', 1),
('meetup', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis a ante aliquet, auctor arcu in, pellentesque turpis. Pellentesque dapibus rutrum tempor. Nunc eu egestas libero. Ut a suscipit quam. Sed cursus eget dui non lacinia. In sed sem dignissim, laoreet lectus sed, lobortis ante. Mauris laoreet eleifend justo, in tincidunt dui tempus ac. Ut interdum vestibulum feugiat. Mauris nec nisi luctus velit aliquam dapibus. Aenean vel blandit mi. Integer eget leo vel mi porta condimentum eget non elit. Aenean ultrices ante vel dolor bibendum interdum. Sed tempus erat massa, eu malesuada ipsum convallis ut. Curabitur faucibus iaculis diam, id eleifend ante dignissim at. Aenean in vulputate tellus, et vestibulum leo. Curabitur finibus nibh eu elit facilisis pharetra.', '11/8/2020 2:20:00 PM', '11/12/2020 2:20:00 PM', 'scott garden', 0),
('hackathon', 'this a hackathon event organised by dell', '12/9/2020 2:20:00 PM', '12/12/2020 2:20:00 PM', 'online', 0),
('hack2hire', 'by dell', '12/29/2020 2:20:00 PM', '12/31/2020 2:20:00 PM', '', 0);
GO