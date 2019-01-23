<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import= "com.google.gson.Gson" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="bean2.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/skel.min.js"></script>
<script src="resources/js/util.js"></script>
<script src="resources/js/main.js"></script>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
 <%
    String clientId = "80szwe1ZVZTbgxMk2lFI";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "7S2LfP8Tia";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:7777/lushProject/callback.jsp", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      String res = new String();
      while ((inputLine = br.readLine()) != null) {
        res += inputLine;
      }
      /*   APIExamMemberProfile a = new APIExamMemberProfile();
      a.APIExamMemberProfile(res); */
        System.out.print(res.toString());
      br.close();
      if(responseCode==200) {
       JSONParser parser = new JSONParser();
       Object obj = parser.parse(res);
       JSONObject jsonObj = (JSONObject) obj;
       access_token = (String) jsonObj.get("access_token");
       refresh_token = (String) jsonObj.get("refresh_token");
        out.println(res.toString()+"<br>");
        out.println("access_token : "+ access_token+"<br>");
        out.println("refresh_token : "+ refresh_token+"<br>");
        }
         } catch (Exception e) {
            System.out.println(e);
         }
         session.setAttribute("code", code);
          session.setAttribute("access_token", access_token);
       session.setAttribute("refresh_token", refresh_token);
      
       String header = "Bearer " + access_token;
    
    try {
        apiURL = "https://openapi.naver.com/v1/nid/me";
        URL url = new URL(apiURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Authorization", header);
        int responseCode = con.getResponseCode();
        BufferedReader br;
        if(responseCode==200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String inputLine;
        StringBuffer res = new StringBuffer();
        while ((inputLine = br.readLine()) != null) {
           res.append(inputLine);
        }
        br.close();
        
         //JSON파싱하기
         System.out.println(res.toString());
        JSONParser parser = new JSONParser();
       Object obj = parser.parse(res.toString());
       
       //JSONObject 만들기
       JSONObject jsonObj = (JSONObject) obj;
       
       //JSON한번 더 걸러내기
       JSONObject dataObj = (JSONObject) jsonObj.get("response");
       
       //Gson객체 만들기
        Gson gson = new Gson();
      
         //Gson Beans 객체 만들기
        Member member = new Member();
         
         //Gson을 이용하여 JSONObject를 문자로 바꾸고(직렬화)
       //beans에 담기 (역직렬화)
       //아래의 두 문장을 통해 Json객체를 beans로 관리할 수 있다.
       String data = gson.toJson(dataObj);
         System.out.print(data);
      member = gson.fromJson(data, Member.class);
      
      //member객체에서 그냥 값 꺼내와서 화면에 뿌리기
       System.out.print("nickname : " + member.getNickname() + "<br>");
       out.print("enc_id : " + member.getEnc_id() + "<br>");
       out.print("<img src='"+member.getProfile_image()+"'><br>");
       out.print("age : " + member.getAge() + "<br>");
       out.print("gender : " + member.getGender() + "<br>");
       out.print("id : " + member.getId() + "<br>");
       out.print("birthday : " + member.getBirthday() + "<br>");
      
        session.setAttribute("name", member.getName());
        session.setAttribute("nickname", member.getNickname());
        session.setAttribute("age", member.getAge());
        session.setAttribute("id", member.getId());
        session.setAttribute("enc_id",member.getEnc_id() );
        out.println(session.getAttribute("nickname"));
        response.sendRedirect("frame2.jsp");
    }
        catch (Exception e) {
            System.out.println(e);
        }
  %>
  
</body>
</html>