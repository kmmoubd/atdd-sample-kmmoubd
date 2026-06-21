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
        request.setAttribute("arg3", null);
        request.setAttribute("result", null);

        request.getRequestDispatcher("calculator.jsp").forward(request, response);
    }

    
    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String arg1 = request.getParameter("arg1");
    String arg2 = request.getParameter("arg2");
    String arg3 = request.getParameter("arg3"); // for 3-number ops
    String operation = request.getParameter("operation");

    request.setAttribute("arg1", arg1);
    request.setAttribute("arg2", arg2);
    request.setAttribute("arg3", arg3);

    try {
        int a = Integer.parseInt(arg1);
        int b = Integer.parseInt(arg2);

        int result = 0;

        // ➕ ADDITION (2 numbers)
        if ("add".equalsIgnoreCase(operation)) {
            result = a + b;
        }

        // ✖ MULTIPLICATION (2 numbers)
        else if ("mul".equalsIgnoreCase(operation)) {
            result = a * b;
        }

        // ➖ SUBTRACTION
        else if ("sub".equalsIgnoreCase(operation)) {
            result = a - b;
        }

        // ➗ DIVISION
        else if ("div".equalsIgnoreCase(operation)) {
            if (b == 0) {
                request.setAttribute("result", "N/A");
                return;
            }
            result = a / b;
        }

        // ➕ ADD 3 NUMBERS
        else if ("add3".equalsIgnoreCase(operation)) {
            int c = Integer.parseInt(arg3);
            result = a + b + c;
        }

        // ✖ MULTIPLY 3 NUMBERS
        else if ("mul3".equalsIgnoreCase(operation)) {
            int c = Integer.parseInt(arg3);
            result = a * b * c;
        }

        request.setAttribute("result", String.valueOf(result));

    } catch (Exception e) {
        request.setAttribute("result", "N/A");
    }
}
    
}