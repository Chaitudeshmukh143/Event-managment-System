package com.pack.event_managment_system;

public class Ticket {
    private int ticketId;
    private int eventId;
    private int userId;
    private String ticketType;
    private double price;
    public Ticket(int eventId, int userId, String ticketType, double price) {
        this.eventId = eventId;
        this.userId = userId;
        this.ticketType = ticketType;
        this.price = price;
    }


    public Ticket(int ticketId, int eventId, int userId, String ticketType){
        this.ticketId = ticketId;
        this.eventId = eventId;
        this.userId = userId;
        this.ticketType = ticketType;
    }

    public Ticket(int eventId, int userId, String ticketType){
        this.eventId = eventId;
        this.userId = userId;
        this.ticketType = ticketType;
    }


    public int getTicketId() { return ticketId; }
    public int getEventId() { return eventId; }
    public int getUserId() { return userId; }
    public String getTicketType() { return ticketType; }


	public double getPrice() {  return price; }
}
