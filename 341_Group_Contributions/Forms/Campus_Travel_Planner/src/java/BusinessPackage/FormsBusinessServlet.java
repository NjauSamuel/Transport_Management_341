package BusinessPackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class FormsBusinessServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int fromDepartmentId = Integer.parseInt(request.getParameter("from_department_id"));
            int toDepartmentId = Integer.parseInt(request.getParameter("to_department_id"));
            String communicationContent = request.getParameter("communication_content");

            // Call your business class method to process the form data
            boolean result = YourBusinessClass.processCommunication(fromDepartmentId, toDepartmentId, communicationContent);

            // Set the success/failure message as a request attribute
            if (result) {
                request.setAttribute("message", "Data processed successfully");
            } else {
                request.setAttribute("message", "Error processing data");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
