<html>
<body>
<h1>Ajouter une nouvelle tâche</h1>
<form action="ajoutTache.jsp" method="post">
    Titre : <input type="text" name="titre" required/><br>
    Description : <input type="text" name="description" required/><br>
    Date d'échéance : <input type="date" name="dateEcheance" required/><br>
    <input type="submit" value="Ajouter">
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String dateEcheance = request.getParameter("dateEcheance");

        Task nouvelleTache = new Task(titre, description, dateEcheance);

        ArrayList<Task> listeTaches = (ArrayList<Task>) session.getAttribute("listeTaches");
        if (listeTaches == null) {
            listeTaches = new ArrayList<>();
            session.setAttribute("listeTaches", listeTaches);
        }
        listeTaches.add(nouvelleTache);

        out.println("<p>Tâche ajoutée avec succès !</p>");
    }
%>

<a href="afficherTaches.jsp">Voir les tâches</a>
</body>
</html>
