<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.css" integrity="sha256-RCJT6YvohmGy+rWQe3hpPZez8iaPnirFVfiwaBVCk1k=" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.js" integrity="sha256-6l5QOXZ6Mkg+2tOaJgs8yT7xx2WapaIPQl7qpB55/V0=" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales/ko.js" integrity="sha256-yIkhdy13r6x8Vo7wiayPFIBbHGMwLRbDgNTfsp2TRQI=" crossorigin="anonymous"></script>
 <head>
    <meta charset='utf-8' />
<!--     <link href='fullcalendar-scheduler/main.css' rel='stylesheet' /> -->
<!--     <script src='fullcalendar-scheduler/main.js'></script> -->
    <script>

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        

        var calendar = new FullCalendar.Calendar(calendarEl, {
          locale:'ko',
          selectable: true,
          headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          },
//           dateClick: function(info) {
//             alert('clicked ' + info.dateStr);
//           },
          select: function(info) {
            alert('selected ' + info.startStr + ' to ' + info.endStr);
          }
        });
       
        
        	

        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>