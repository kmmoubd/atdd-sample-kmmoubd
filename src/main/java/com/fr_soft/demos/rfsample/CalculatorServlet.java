package com.fr_soft.demos.rfsample;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculatorServlet extends HttpServlet {

    private static final long serialVersionUID = 6961400581681209885L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("arg1", null);
        request.setAttribute("arg2", null);
        request.setAttribute("result", null);

        request.getRequestDispatcher("calculator.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String arg1 = request.getParameter("arg1");
        String arg2 = request.getParameter("arg2");

        request.setAttribute("arg1", arg1);
        request.setAttribute("arg2", arg2);

        try {
            int a = Integer.parseInt(arg1);
            int b = Integer.parseInt(arg2);

            String operation = request.getParameter("operation");
            int result;

            // DEFAULT = ADDITION
            if ("mul".equalsIgnoreCase(operation)) {
                result = a * b;
            } else {
                result = a + b;
            }

            request.setAttribute("result", String.valueOf(result));

        } catch (Exception e) {
            request.setAttribute("result", "N/A");
        }
    }
}