<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>1:1 채팅 관리</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/css/styles.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .chat-container {
            width: 100%;
            max-width: 900px;
            height: 600px;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
            display: flex;
        }

        .user-list {
            width: 250px;
            border-right: 1px solid #ccc;
            background: #f9f9f9;
            overflow-y: auto;
        }

        .user-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .user-list ul li {
            padding: 15px;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .user-list ul li:hover {
            background-color: #f1f1f1;
        }

        .chat-section {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        .chat-header {
            background: #007bff;
            color: white;
            padding: 10px 20px;
            text-align: center;
            font-size: 1.2em;
            font-weight: bold;
        }

        .chatBox {
            flex-grow: 1;
            padding: 20px;
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            background: #f9f9f9;
        }

        .chatBox .message {
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 10px;
            max-width: 80%;
        }

        .chatBox .message.received {
            background: #e1f5fe;
            align-self: flex-start;
        }

        .chatBox .message.sent {
            background: #c8e6c9;
            align-self: flex-end;
        }

        .chat-input-container {
            display: flex;
            padding: 10px;
            border-top: 1px solid #ddd;
            background: #f4f4f9;
        }

        #adminChatInput {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 20px;
            margin-right: 10px;
            font-size: 1em;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #adminSendButton {
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            background: #007bff;
            color: white;
            font-size: 1em;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #adminSendButton:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- 사이드바 -->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <jsp:include page="/WEB-INF/views/page/admin/layout/sidebar.jsp"/>
        </nav>

        <!-- 메인 콘텐츠 -->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <jsp:include page="/WEB-INF/views/page/admin/layout/header.jsp"/>
            <h2>1:1 채팅 관리</h2>
            <!-- 1:1 채팅 관리 내용 -->
            <div class="chat-container">
                <div class="user-list">
                    <ul id="userList"></ul>
                </div>
                <div class="chat-section">
                    <div class="chat-header">관리자 채팅 화면</div>
                    <h3>채팅 대상: <span id="currentUser"></span></h3>
                    <div class="chatBox" id="adminChatBox"></div>
                    <div class="chat-input-container">
                        <input type="text" id="adminChatInput" placeholder="메시지를 입력하세요..." />
                        <button id="adminSendButton"><i class="fas fa-paper-plane"></i></button>
                    </div>
                </div>
            </div>
            <jsp:include page="/WEB-INF/views/page/admin/layout/footer.jsp"/>
        </main>
    </div>
</div>
<script>
    let contextPath = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/resources/js/chatAdmin.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
