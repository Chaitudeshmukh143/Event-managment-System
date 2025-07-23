package com.pack.event_managment_system;


public class Event {
    private int eventId;
    private int userId;
    private String title;
    private String description;
    private String eventDate;
    private String location;
    private double ticketPrice;
    private int totalTickets;
    private int ticketsAvailable;

   
    public int getEventId() { return eventId; }
    public void setEventId(int eventId) { this.eventId = eventId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getEventDate() { return eventDate; }
    public void setEventDate(String eventDate) { this.eventDate = eventDate; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public double getTicketPrice() { return ticketPrice; }
    public void setTicketPrice(double ticketPrice) { this.ticketPrice = ticketPrice; }

    public int getTotalTickets() { return totalTickets; }
    public void setTotalTickets(int totalTickets) { this.totalTickets = totalTickets; }

    public int getTicketsAvailable() { return ticketsAvailable; }
    public void setTicketsAvailable(int ticketsAvailable) { this.ticketsAvailable = ticketsAvailable; }
}

