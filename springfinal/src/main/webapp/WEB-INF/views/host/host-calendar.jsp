<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link href="${pageContext.request.contextPath}/resources/fullcalendar/main.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/fullcalendar/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/fullcalendar/locales-all.js"></script>
     <meta charset='utf-8' />
    <link href='fullcalendar/main.css' rel='stylesheet' />
    <script src='fullcalendar/main.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>

<body>    
<div id="calendar"></div>

</body>